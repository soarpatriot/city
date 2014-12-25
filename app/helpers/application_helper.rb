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
end
