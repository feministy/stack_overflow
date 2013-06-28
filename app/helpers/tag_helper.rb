module TagHelper
  def parse_tags(tag_text)
    tag_text.split(' ')
  end

  def order_tags(tags)
    tag_array = []

    tags.each do |tag|
      tag_array << [tag.questions.count, tag]
    end

    tag_array.sort!.reverse!

    tags_output = []

    tag_array.each do |element|
      tags_output << element[1]
    end

    tags_output
  end
end
