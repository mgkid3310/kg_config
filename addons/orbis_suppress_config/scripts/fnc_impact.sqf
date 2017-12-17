#include "define_suppress.hpp"
#include "script_component.hpp"

if !(alive player) exitWith {};

private _intensity = GVAR(intensity);
if (((vehicle player) == player) || (isTurnedOut player)) then {
	_intensity = _intensity * 0.3;
};

GVAR(impactBlur) ppEffectAdjust [0.015 * _intensity, 0.015 * _intensity, 0.2 * _intensity, 0.2 * _intensity];
GVAR(impactBlur) ppEffectCommit 0;
GVAR(impactCC) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.4 * _intensity], [1, 1, 1, 1],[ 1, 1, 1, 0]];
GVAR(impactCC) ppEffectCommit 0;

GVAR(impactBlur) ppEffectAdjust [0, 0, 0, 0];
GVAR(impactBlur) ppEffectCommit 0.5;
GVAR(impactCC) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1],[1, 1, 1, 0]];
GVAR(impactCC) ppEffectCommit 0.25;

// Makes the player twitch if it's been a while since he was getting shot at
if ((time - GVAR(lastShotAt)) >= 120) then {
	addCamShake [3 * _intensity, 0.4, 80];
};
