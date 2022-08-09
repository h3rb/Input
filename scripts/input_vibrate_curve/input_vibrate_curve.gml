/// @desc Vibrates a player's controller using animation curve channels for a duration, the units of which are determined by INPUT_TIMER_MILLISECONDS
///       Curves are evaluated if they contain one channel, or individual channels named "left" and "right"
/// @param   animationCurve
/// @param   time
/// @param   [playerIndex=0]
function input_vibrate_curve(_curve, _time, _player_index = 0)
{
    if (!__INPUT_GAMEPAD_VIBRATION_SUPPORT) exit;
    
    if (!is_real(_curve) || !is_struct(animcurve_get(_curve)))
    {
        __input_error("Vibration curve set to an illegal value (typeof=", typeof(_curve), ")");
    }
    
    __INPUT_VERIFY_PLAYER_INDEX

    global.__input_players[_player_index].__haptic_vibrate_curve(_curve, _time);
}