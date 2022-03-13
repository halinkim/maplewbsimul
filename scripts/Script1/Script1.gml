// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_rectangle_wh(x1, y1, width, height, outline){
	draw_rectangle(x1, y1, x1 + width, y1 + height, outline)
}

function cooltime_final(base, union, item){
	if (union == 1) {
	union = 0	
	}
	cool0 = base * (100 - union) / 100
	
	if ((cool0 - item) >= 10) {
		return cool0 - item
	}
	else if (cool0 > 10) {
		return max(5, 10 * (100 - (- cool0 + item + 10)* 5) / 100)
	}
	else {
		return max(5, cool0 * (100 - item * 5) / 100)
	}
}

function drawUnit(num) {
	if (num < 10000) {
		return string(num)
	}
	else if (num < 100000000) {
		num1 = floor(num / 10000)
		num2 = num % 10000
		return string(num1) + "만" + string(num2)
	}
	else if (num < 1000000000000) {
		num1 = floor(num / 100000000)
		num2 = floor(num / 10000) % 10000
		num3 = num % 10000
		return string(num1) + "억" + string(num2) + "만" + string(num3)
	}
	else {
		num1 = floor(num / 1000000000000)
		num2 = floor(num / 100000000) % 10000
		num3 = floor(num / 10000) % 10000
		num4 = num % 10000
		return string(num1) + "조" + string(num2) + "억" + string(num3) + "만" + string(num4)
	}
}

function drawUnitSimple(num) {
	if (num < 10000) {
		return string(num)
	}
	else if (num < 100000000) {
		num1 = floor(num / 10000)
		num2 = num % 10000
		return string(num1) + "만" + string(num2)
	}
	else if (num < 1000000000000) {
		num1 = floor(num / 100000000)
		num2 = floor(num / 10000) % 10000
		num3 = num % 10000
		return string(num1) + "억" + string(num2) + "만" + string(num3)
	}
	else {
		num1 = floor(num / 1000000000000)
		num2 = floor(num / 100000000) % 10000
		num3 = floor(num / 10000) % 10000
		num4 = num % 10000
		return string(num1) + "조" + string(num2) + "억" + string(num3) + "만" + string(num4)
	}
}