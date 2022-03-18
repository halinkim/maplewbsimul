/// @description Insert description here
// You can write your code in this editor
c_gray0 = make_color_rgb(51, 51, 51)
c_back = make_color_rgb(242, 242, 230)
if (array_length(TipText)) {
	draw_set_font(fnt10)
	DrawText = TipText[0]
	TextLength = string_length(DrawText)
	LengthMax = 20
	TextHeight = string_height("갉")
	TextWidth = string_width("가나다라마바사") / 7 - 2.5
	TextLine = ceil(TextLength / LengthMax)
	
	Margin = 4
	
	TextArr = []
	MaxLength = 0
	
	
	MaxWidth = 256
	var TempText = "";
	for (var i=1; i<=TextLength; i++) {
		var NowChar = string_char_at(DrawText, i);
		if (string_width(TempText + NowChar) > MaxWidth) {
			array_push(TextArr, TempText)
			if (NowChar == " ") {
				TempText = ""
			}
			else {
				TempText = NowChar
			}
		}
		else {
			TempText += NowChar
		}
		if (i == TextLength) {
			array_push(TextArr, TempText)
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//for (var i=0; i<TextLine; i++) {
	//	nowText = ""
	//	if (i == TextLine - 1) {
	//		nowLength = (TextLength - 1) % LengthMax + 1
	//	}
	//	else {
	//		nowLength = LengthMax
	//	}
	//	for (var j=1; j<=nowLength; j++) {
	//		AddText = string_char_at(DrawText, LengthMax * i + j)
	//		if (j == 1 and AddText == " ") {
	//			continue
	//		}
	//		nowText += AddText
	//	}
	//	array_push(TextArr, nowText)
	//	MaxLength = max(MaxLength, string_width(nowText))
	//}
	
	draw_set_alpha(0.9)
	draw_set_color(c_gray0)
	draw_rectangle(mouse_x, mouse_y + 20, mouse_x + MaxWidth + 2 * Margin, mouse_y + 20 + TextHeight * array_length(TextArr) + 2 * Margin, 0)
	draw_set_alpha(1)
	draw_set_color(c_back)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	

	for (var i=0; i<array_length(TextArr); i++) {
		draw_text(mouse_x + Margin, mouse_y + 20 + Margin + TextHeight * i, TextArr[i])
	}
}