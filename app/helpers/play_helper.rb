module PlayHelper
  def keyboard_lines
    ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
  end

  def render_keyboard_line(line)
    content_tag :div, class: 'flex gap-1 justify-center' do
      buttons = line.chars.map do |key|
        link_to key, "javascript:addLetter('#{key}')", class: "keyboard-buttons", id: "key-#{key}"
      end
      buttons.unshift(link_to "Enter", "javascript:checkGuess()", class:"keyboard-buttons") if line[0]=="Z"
      buttons.push(link_to raw("<span class=\"material-symbols-outlined\">backspace</span>"), "javascript:removeLetter()", class:"keyboard-buttons") if line[-1]=="M"
      safe_join(buttons)
    end
  end
end
