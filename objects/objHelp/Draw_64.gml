/// @description Insert description here
// You can write your code in this editor
c_gray0 = make_color_rgb(51, 51, 51)
c_back = make_color_rgb(242, 242, 230)

draw_set_font(fnt10)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_gray0)
draw_text(0, 0, "도움말 : F1")

if (keyboard_check_pressed(vk_f1)) {
	HelpOn = 1 - HelpOn
}

if (surface_exists(HelpS)) {
	draw_set_alpha(HelpAlpha)
	surface_set_target(HelpS)
	draw_clear_alpha(c_gray0, 1)

	draw_set_font(fnt10)
	draw_set_color(c_back)
	i = 0
	TextHeight = 24
	function HelpText(text) {
		draw_text(64, 64 + i * TextHeight, text)
		i++;
	}
	draw_text(64, 64 + i * TextHeight, "메이플스토리 윈드브레이커 시뮬레이터 ver0.1")
	i++;
	HelpText("F2를 눌러 사용법과 소스 파일, 최신 버전 프로그램이 있는 깃허브에 접속할 수 있습니다.")
	HelpText("문의 : 카카오톡 오픈 프로필 [스카니아/Pz파전/훰린] or 이메일 [phasestudio1024@gmail.com]")
	HelpText("폰트 정보 : Spoqa Han Sans Neo")
	draw_text(64, 64 + i * TextHeight, "Copyright 2022. PHASE Studio. All rights reserved.")
	i++;


	surface_reset_target()
}
else {
	HelpS = surface_create(800, 600)
}
draw_surface(HelpS, room_width / 2 - 400, room_height / 2 - 300)
draw_set_alpha(1)