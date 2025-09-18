// Inputs
global.key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
global.key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
global.key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z"));
global.key_attack = keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(ord("X"));