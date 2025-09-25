hsp = 0;
vsp = 0;
grv = 0.15;
jumpVel = -3.5;
hSpeed = 1.75;
canJump = 0;
canAttack = 0;
attackCooldown = 10;
landed = false;
landAnimation = false;
attacking = false;
airborne = false;

playerState = PlayerState.Idle;

idleSprite = sPlayer;
runSprite = sPlayerRun;
jumpStartSprite = sPlayerJumpStart;
jumpSprite = sPlayerJump;
fallSprite = sPlayerFall;
landSprite = sPlayerLand;
runLandSprite = sPlayerRunLand;
attackSprite = sPlayerSlash;

enum PlayerState
{
	Idle,
	Run,
	JumpStart,
	Jump,
	Fall,
	Land
}