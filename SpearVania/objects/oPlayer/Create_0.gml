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
jumpStartAnimation = false;
attacking = false;
stabbing = false;
bufferedStab = false;
airborne = false;
canSpawnHitbox = false;

playerState = PlayerState.Idle;

idleSprite = sPlayer;
runSprite = sPlayerRun;
jumpStartSprite = sPlayerJumpStart;
jumpSprite = sPlayerJump;
fallSprite = sPlayerFall;
landSprite = sPlayerLand;
runLandSprite = sPlayerRunLand;
attackSprite = sPlayerSlash;
stabSprite = sPlayerStab;

enum PlayerState
{
	Idle,
	Run,
	JumpStart,
	Jump,
	Fall,
	Land
}