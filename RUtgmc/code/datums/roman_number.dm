//Переводит арабские цифры в римские
//нагло спизжено с сайта https://devexe.top/eolimp/116

/datum/roman_number
	var/list/roman_numbers = ["L", "XL", "X", "IX", "V", "IV", "I", ""]
	var/list/normal_numbers = ["50", "40", "10", "9", "5", "4", "1", "0"]

/datum/roman_number/proc/arabic_num_in_roman(orig_num)
	var/roman_num							//Само римское число, которое мы получим
	var/i = 0
	while(orig_num > 0)
		while(Ar[i] <= orig_num)
			roman_num += roman_numbers[i]	//К римскому числу мы прибавляем "палки"
			orig_num -= normal_number[i]	//от оригинального числа мы отнимаем значение "палок"
		i++;
	return roman_num
