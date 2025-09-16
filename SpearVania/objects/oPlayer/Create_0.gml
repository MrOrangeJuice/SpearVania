hsp = 0;
vsp = 0;
grv = 0.15;
jumpVel = -3;
hSpeed = 1.5;
canJump = 0;
landed = false;
landAnimation = false;

playerState = PlayerState.Idle;

idleSprite = sPlayer;
runSprite = sPlayerRun;
jumpStartSprite = sPlayerJumpStart;
jumpSprite = sPlayerJump;
fallSprite = sPlayerFall;
landSprite = sPlayerLand;
runLandSprite = sPlayerRunLand;

enum PlayerState
{
	Idle,
	Run,
	JumpStart,
	Jump,
	Fall,
	Land
}