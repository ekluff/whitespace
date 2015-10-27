class Image < ActiveRecord::Base
  has_one                           :exif, dependent: :destroy
  has_attached_file                 :asset, styles: {
                                              large: "2000x2000>",
                                              medium: "768x768>",
                                              small: "240x240>",
                                              thumb: "100x100>" },
                                            default_style: :medium,
                                            convert_options: {
                                              all: "-strip",
                                            }

  accepts_nested_attributes_for     :exif
  acts_as_taggable_on               :locations, :contents, :keywords

  before_save                       :format_title, on: [:create, :update]
  after_post_process                :save_exif

  validates                         :asset, attachment_presence: true
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  private

  def save_exif
    asset = EXIFR::JPEG.new(self.asset.queued_for_write[:original].path)
    return unless asset

    self.create_exif({
      camera:          asset.model,
      software:        asset.software,
      iso:             asset.iso_speed_ratings.to_i,
      shutter:         asset.shutter_speed_value.to_s,
      aperture:        asset.aperture_value,
      taken:           asset.date_time_original,
      exposure_bias:   asset.exposure_bias_value.to_s,
      flash:          (asset.flash == 1),
      focal_length:    asset.focal_length.to_s,
    })
  end

  def format_title
    self.title = self.title.downcase.titleize
  end

end
