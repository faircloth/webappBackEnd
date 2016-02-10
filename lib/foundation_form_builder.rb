class FoundationFormBuilder < ActionView::Helpers::FormBuilder

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::TextHelper

  attr_accessor :output_buffer

  # Review videos for how to automatically build out form types
  # %w(text_field select_field).each do |form_method|
  #   define_method(form_method) do |*args|
  #     attribute = args[0]
  #     options = args[1] || {}
  #   end
  # end

  def text_field(attribute, options={})
    options[:label] ||= attribute
    label_text ||=options.delete(:label).to_s.titleize
    wrapper do
      label(attribute, label_text) + 
      super(attribute, options)
    end
  end

  def submit(text, options={})
    options[:class] ||= "button radius expand"
    wrapper do
      super(text, options)
    end
  end

  def wrapper(options={}, &block)
    content_tag(:div, class: "row") do
      content_tag(:div, capture(&block), class: "small-12 columns")
    end
  end

end