extends Control

### CAPTCHA
var allowed_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" # Edit Allowed characters here
var length = 8 # Change Captcha Lenght here
var result = ""

func _ready():
	var captcha = genererate_captcha()
	captchaLines()
	$VBoxContainer/ColorRect/Captcha.text = str(result)

func genererate_captcha(): #Generate the first Captcha
	randomize()
	for i in range(length):
		var random_characters = allowed_characters[randi() % allowed_characters.length()]
		result += random_characters
	return result
	
func _on_RefreshCaptcha_pressed(): #Button to generate a new Captcha and new colours for the lines
	result = ""
	var captcha = genererate_captcha()
	captchaLines()
	$VBoxContainer/ColorRect/Captcha.text = str(result)

func captchaLines(): # Randomly generate colours for the lines to complicate the captcha 
	
	var random_colour1 = Color(randf(), randf(), randf(), 1)
	var random_colour2 = Color(randf(), randf(), randf(), 1)
	var random_colour3 = Color(randf(), randf(), randf(), 1)
	var random_colour4 = Color(randf(), randf(), randf(), 1)
	var random_colour5 = Color(randf(), randf(), randf(), 1)
	var random_colour6 = Color(randf(), randf(), randf(), 1)
	var random_colour7 = Color(randf(), randf(), randf(), 1)
	var random_colour8 = Color(randf(), randf(), randf(), 1)
	
	$VBoxContainer/ColorRect/Captcha/ColorRect.color = random_colour1
	$VBoxContainer/ColorRect/Captcha/ColorRect2.color = random_colour2
	$VBoxContainer/ColorRect/Captcha/ColorRect3.color = random_colour3
	$VBoxContainer/ColorRect/Captcha/ColorRect4.color = random_colour4
	$VBoxContainer/ColorRect/Captcha/ColorRect5.color = random_colour5
	$VBoxContainer/ColorRect/Captcha/ColorRect6.color = random_colour6
	$VBoxContainer/ColorRect/Captcha/ColorRect7.color = random_colour7
	$VBoxContainer/ColorRect/Captcha/ColorRect8.color = random_colour8

func _on_Validate_pressed():
	if $VBoxContainer/LineEdit.text != "":
		if $VBoxContainer/LineEdit.text != result:
			$VBoxContainer/ValidateCaptchaResul.text = "Wrong Captcha"
			
		else:
			$VBoxContainer/ValidateCaptchaResul.text = "Good Captcha"
	else:
		$VBoxContainer/ValidateCaptchaResul.text = "ENTER CAPTCHA"
