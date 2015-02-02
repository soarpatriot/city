module ApplicationHelper

  def human_file_size bytes_size
    kb_size = bytes_size / 1024.0
    if kb_size < 1024
      return sprintf("%.2f", kb_size) + " kb"
    else
      mb_size = kb_size / 1024.0
      return sprintf("%.2f", mb_size) + " mb"
    end
  end

  def meta_keywords(tags = nil)
    if tags.present?
      content_for :meta_keywords, tags
    else
      content_for?(:meta_keywords) ? content_for(:meta_keywords) : "蔚县 蔚县信息 蔚县生活 蔚县@我 商店 蔚县商店 信息发布 蔚县生活信息"
    end
  end

  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    else
      content_for?(:meta_description) ? content_for(:meta_description) : "蔚县生活信息,食品,房屋出租,房屋买卖,婚庆,汽车买卖,建筑建材,家政服务,招聘,工艺品,美容美发,衣服,化妆品,免费发布个人信息,开启商店"
    end
  end
end
