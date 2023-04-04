#macro __INPUT_VERSION "6.0.0"
#macro __INPUT_DATE    "2023-02-24"
#macro __INPUT_DEBUG   false



#region Forbidden Fruit

#macro __INPUT_2D_CHECKER_STATIC_RESULT  true

#macro __INPUT_DEBUG_PROFILES  false
#macro __INPUT_DEBUG_SOURCES   false
#macro __INPUT_DEBUG_BINDING   false
#macro __INPUT_DEBUG_VERBS     false

#macro __INPUT_EXTERNAL_DEBUG_LOG  false  //Do NOT set to <true> unless directed (!)

//How many frames to wait before scanning for connected gamepads
//This works around Steam sometimes reporting confusing connection/disconnection events on boot
#macro __INPUT_GAMEPADS_TICK_PREDELAY  10     

#macro __INPUT_GLOBAL_STATIC_LOCAL     static _global = __input_global();
#macro __INPUT_GLOBAL_STATIC_VARIABLE  static __global = __input_global();

#endregion



#macro __INPUT_BINDING_KEY               "key"
#macro __INPUT_BINDING_MOUSE_BUTTON      "mouse button"
#macro __INPUT_BINDING_MOUSE_WHEEL_UP    "mouse wheel up"
#macro __INPUT_BINDING_MOUSE_WHEEL_DOWN  "mouse wheel down"
#macro __INPUT_BINDING_VIRTUAL_BUTTON    "virtual button"
#macro __INPUT_BINDING_GAMEPAD_BUTTON    "gamepad button"
#macro __INPUT_BINDING_GAMEPAD_AXIS      "gamepad axis"

#macro INPUT_GAMEPAD_TYPE_XBOX_ONE      "xbox one"
#macro INPUT_GAMEPAD_TYPE_XBOX_360      "xbox 360"
#macro INPUT_GAMEPAD_TYPE_PS5           "ps5"
#macro INPUT_GAMEPAD_TYPE_PS4           "ps4"
#macro INPUT_GAMEPAD_TYPE_PSX           "psx"
#macro INPUT_GAMEPAD_TYPE_SWITCH        "switch"
#macro INPUT_GAMEPAD_TYPE_JOYCON_LEFT   "switch joycon left"
#macro INPUT_GAMEPAD_TYPE_JOYCON_RIGHT  "switch joycon right"
#macro INPUT_GAMEPAD_TYPE_GAMECUBE      "gamecube"
#macro INPUT_GAMEPAD_TYPE_N64           "n64"
#macro INPUT_GAMEPAD_TYPE_SATURN        "saturn"
#macro INPUT_GAMEPAD_TYPE_SNES          "snes"
#macro INPUT_GAMEPAD_TYPE_UNKNOWN       "unknown"

#macro INPUT_KEYBOARD      __input_global().__source_keyboard
#macro INPUT_MOUSE         __input_global().__source_mouse
#macro INPUT_GAMEPAD       __input_global().__source_gamepad
#macro INPUT_TOUCH         __input_global().__source_touch
#macro INPUT_MAX_GAMEPADS  12

#macro INPUT_KEYBOARD_LOCALE  __input_global().__keyboard_locale
#macro INPUT_KEYBOARD_TYPE    __input_global().__keyboard_type

#macro INPUT_VIRTUAL_BACKGROUND  __input_global().__virtual_background

#macro __INPUT_ON_PS       ((os_type == os_ps4)     || (os_type == os_ps5))
#macro __INPUT_ON_XBOX     ((os_type == os_xboxone) || (os_type == os_xboxseriesxs))
#macro __INPUT_ON_CONSOLE  (__INPUT_ON_XBOX || __INPUT_ON_PS || (os_type == os_switch))

#macro __INPUT_ON_DESKTOP  ((os_type == os_macosx)  || (os_type == os_linux) || (os_type == os_windows))
#macro __INPUT_ON_APPLE    ((os_type == os_macosx)  || (os_type == os_ios)   || (os_type == os_tvos))
#macro __INPUT_ON_MOBILE   ((os_type == os_android) || (os_type == os_ios)   || (os_type == os_tvos))

#macro __INPUT_ON_OPERAGX  (os_type == os_operagx)
#macro __INPUT_ON_WEB      ((os_browser != browser_not_a_browser) || __INPUT_ON_OPERAGX)

#macro __INPUT_STEAMWORKS_SUPPORT         (((os_type == os_windows) || (os_type == os_linux)) && !__INPUT_ON_WEB)
#macro __INPUT_TOUCH_SUPPORT              (__INPUT_ON_MOBILE  || __INPUT_ON_PS  || (os_type == os_switch) || (os_type == os_windows))
#macro __INPUT_TOUCH_PRIMARY              (!INPUT_TOUCH_IS_MOUSE && (__INPUT_ON_MOBILE  || (os_type == os_switch) || (__input_global().__on_steam_deck && (os_type == os_windows))))
#macro __INPUT_KEYBOARD_NORMATIVE         (__INPUT_ON_DESKTOP || __INPUT_ON_WEB || (os_type == os_switch))
#macro __INPUT_KEYBOARD_SUPPORT           (__INPUT_KEYBOARD_NORMATIVE || (os_type == os_android))
#macro __INPUT_GAMEPAD_VIBRATION_SUPPORT  (__INPUT_ON_CONSOLE || (!__INPUT_ON_WEB && (os_type == os_windows)))
#macro __INPUT_SDL2_SUPPORT               (!__INPUT_ON_WEB && (__INPUT_ON_DESKTOP || (os_type == os_android)))

#macro __INPUT_HOLD_THRESHOLD           0.2  //Minimum value from an axis for that axis to be considered activated at the gamepad layer. This is *not* the same as min/max thresholds for players
#macro __INPUT_DELTA_HOTSWAP_THRESHOLD  0.1  //Minimum (absolute) change in gamepad mapping value between frames to register as new input. This triggers hotswapping

#macro __INPUT_RATE_LIMIT_DURATION  500 //In milliseconds

//Valid keycode bounds
#macro __INPUT_KEYCODE_MIN 8
#macro __INPUT_KEYCODE_MAX 57343

//Extended gamepad constants
#macro gp_guide     32889
#macro gp_misc1     32890
#macro gp_touchpad  32891
#macro gp_paddle1   32892
#macro gp_paddle2   32893
#macro gp_paddle3   32894
#macro gp_paddle4   32895

//Enables analogue axis checks from triggers on XInput
#macro __XINPUT_AXIS_LT  4106
#macro __XINPUT_AXIS_RT  4107

//Unfortunately, versions prior to v5.2 used these values for extended gamepad constants
//They collide with GameMaker's native constants for gamepad axis values for PS4/PS5 controllers
#macro __INPUT_LEGACY_GP_GUIDE     32789 //gp_axis_acceleration_x
#macro __INPUT_LEGACY_GP_MISC1     32790 //gp_axis_acceleration_y
#macro __INPUT_LEGACY_GP_TOUCHPAD  32791 //gp_axis_acceleration_z
#macro __INPUT_LEGACY_GP_PADDLE1   32792 //gp_axis_angular_velocity_x
#macro __INPUT_LEGACY_GP_PADDLE2   32793 //gp_axis_angular_velocity_y
#macro __INPUT_LEGACY_GP_PADDLE3   32794 //gp_axis_angular_velocity_z
#macro __INPUT_LEGACY_GP_PADDLE4   32795 //gp_axis_orientation_x
                                         //gp_axis_orientation_y = 32796
                                         //gp_axis_orientation_z = 32797
                                         //gp_axis_orientation_w = 32798

//Extended keycode constants
#macro vk_clear       12
#macro vk_capslock    20
#macro vk_menu        93
#macro vk_scrollock   145
                      
#macro vk_semicolon   186
#macro vk_comma       188
#macro vk_fslash      191
#macro vk_bslash      220
#macro vk_lbracket    219
#macro vk_rbracket    221

#macro vk_apostrophe (((os_type == os_macosx) && !__INPUT_ON_WEB)? 192 : 222)
#macro vk_equals     (((os_type == os_macosx) && !__INPUT_ON_WEB)?  24 : 187)
#macro vk_numlock    ((__INPUT_ON_APPLE && __INPUT_ON_WEB)? 12 : 144)
#macro vk_hyphen     (((os_type == os_switch) || ((os_type == os_macosx) && !__INPUT_ON_WEB))? 109 : 189)
#macro vk_rmeta      ((os_type == os_macosx)? ((__INPUT_ON_APPLE && __INPUT_ON_WEB)? 93 : 91) : 92)
#macro vk_backtick   ((os_type == os_macosx)?  50 : ((os_type == os_linux)? 223 : 192))
#macro vk_lmeta      ((os_type == os_macosx)?  92 : 91)
#macro vk_period     ((os_type == os_switch)? 110 : 190)

// gp_axislh     = 32785             32769 = gp_face1
// gp_axislv     = 32786             32770 = gp_face2
// gp_axisrh     = 32787             32771 = gp_face3
// gp_axisrv     = 32788             32772 = gp_face4
// gp_shoulderl  = 32773             32773 = gp_shoulderl
// gp_shoulderr  = 32774             32774 = gp_shoulderr
// gp_shoulderlb = 32775             32775 = gp_shoulderlb
// gp_shoulderrb = 32776             32776 = gp_shoulderrb
// gp_padu       = 32781             32777 = gp_select
// gp_padd       = 32782             32778 = gp_start
// gp_padl       = 32783             32779 = gp_stickl
// gp_padr       = 32784             32780 = gp_stickr
// gp_face1      = 32769             32781 = gp_padu
// gp_face2      = 32770             32782 = gp_padd
// gp_face3      = 32771             32783 = gp_padl
// gp_face4      = 32772             32784 = gp_padr
// gp_stickl     = 32779             32785 = gp_axislh
// gp_stickr     = 32780             32786 = gp_axislv
// gp_select     = 32777             32787 = gp_axisrh
// gp_start      = 32778             32788 = gp_axisrv
// Plus custom buttons:
// gp_guide      = 32889             32889 = gp_guide
// gp_misc1      = 32890             32890 = gp_misc1
// gp_touchpad   = 32891             32891 = gp_touchpad
// gp_paddle1    = 32892             32892 = gp_paddle1
// gp_paddle2    = 32893             32893 = gp_paddle2
// gp_paddle3    = 32894             32894 = gp_paddle3
// gp_paddle4    = 32895             32895 = gp_paddle4

enum __INPUT_SOURCE
{
    KEYBOARD,
    MOUSE,
    GAMEPAD,
    TOUCH,
    __SIZE
}

enum __INPUT_MAPPING
{
    BUTTON,
    AXIS,
    HAT,
    HAT_TO_AXIS,
    BUTTON_TO_AXIS,
    SPLIT_AXIS,
    __SIZE
}

enum __INPUT_VERB_TYPE
{
    __BASIC,
    __CHORD,
}

enum __INPUT_TRIGGER_EFFECT
{
    __TYPE_OFF,
    __TYPE_FEEDBACK,
    __TYPE_WEAPON,
    __TYPE_VIBRATION,
}

//INPUT_STATUS.DISCONNECTED *must* be zero so that array_size() initializes gamepad status to disconnected
//See __input_system_tick() for more details
enum INPUT_STATUS
{
    NEWLY_DISCONNECTED = -1,
    DISCONNECTED       =  0,
    NEWLY_CONNECTED    =  1,
    CONNECTED          =  2,
}

enum INPUT_SOURCE_MODE
{
    FIXED,        //Player sources won't change unless manually editted
    JOIN,         //Starts source assignment, typically used for multiplayer
    HOTSWAP,      //Player 0's source is determined by most recent input
    MIXED,        //Player 0 can use a mixture of keyboard, mouse, and any gamepad
    MULTIDEVICE,  //Player 0 can use a mixture of keyboard, mouse, and any gamepad, but gamepad bindings are specific to each device
}

enum INPUT_COORD_SPACE
{
    ROOM,
    GUI,
    DEVICE,
    __SIZE,
}

//DualSense haptic trigger effect states
enum INPUT_TRIGGER_STATE
{
    EFFECT_OFF               = ps5_gamepad_trigger_effect_state_off,
    EFFECT_FEEDBACK_STANDBY  = ps5_gamepad_trigger_effect_state_feedback_standby,
    EFFECT_FEEDBACK_ACTIVE   = ps5_gamepad_trigger_effect_state_feedback_active,
    EFFECT_WEAPON_STANDBY    = ps5_gamepad_trigger_effect_state_weapon_standby,
    EFFECT_WEAPON_PULLING    = ps5_gamepad_trigger_effect_state_weapon_pulling,
    EFFECT_WEAPON_FIRED      = ps5_gamepad_trigger_effect_state_weapon_fired,
    EFFECT_VIBRATION_STANDBY = ps5_gamepad_trigger_effect_state_vibration_standby,
    EFFECT_VIBRATION_ACTIVE  = ps5_gamepad_trigger_effect_state_vibration_active,
    EFFECT_INTERCEPTED       = ps5_gamepad_trigger_effect_state_intercepted,
}

enum INPUT_GYRO
{
    AXIS_PITCH,
    AXIS_YAW,
    AXIS_ROLL
}

enum INPUT_VIRTUAL_TYPE
{
    BUTTON,
    DPAD_4DIR,
    DPAD_8DIR,
    THUMBSTICK,
}

enum INPUT_VIRTUAL_RELEASE
{
    DO_NOTHING,
    DESTROY,
    RESET_POSITION,
}



#macro __INPUT_VERIFY_PLAYER_INDEX  if (_player_index < 0)\
                                    {\
                                        __input_error("Invalid player index provided (", _player_index, ")");\
                                        return undefined;\
                                    }\
                                    if (_player_index >= INPUT_MAX_PLAYERS)\
                                    {\
                                        __input_error("Player index too large (", _player_index, " must be less than ", INPUT_MAX_PLAYERS, ")\nIncrease INPUT_MAX_PLAYERS to support more players");\
                                        return undefined;\
                                    }

#macro __INPUT_GET_VERB_STRUCT  var _verb_struct = _global.__players[_player_index].__verb_state_dict[$ _verb];\
                                if (!is_struct(_verb_struct))\
                                {\
                                    __input_error("Verb not recognised (", _verb, ")");\
                                    return undefined;\
                                }
                                
#macro __INPUT_VERIFY_ALTERNATE_INDEX  if (_alternate < 0)\
                                       {\
                                           __input_error("Invalid \"alternate\" argument (", _alternate, ")");\
                                           return undefined;\
                                       }\
                                       if (_alternate >= INPUT_MAX_ALTERNATE_BINDINGS)\
                                       {\
                                           __input_error("\"alternate\" argument too large (", _alternate, " must be less than ", INPUT_MAX_ALTERNATE_BINDINGS, ")\nIncrease INPUT_MAX_ALTERNATE_BINDINGS for more alternate binding slots");\
                                           return undefined;\
                                       }

#macro __INPUT_VERIFY_BASIC_VERB_NAME  if (variable_struct_exists(_global.__chord_verb_dict, _verb_name)) __input_error("\"", _verb_name, "\" is a chord verb. Verbs passed to this function must be basic verb");\
                                       if (!variable_struct_exists(_global.__basic_verb_dict, _verb_name)) __input_error("Verb \"", _verb_name, "\" not recognised");
                                       
                                       
                                       
#macro __INPUT_VERIFY_PROFILE_NAME  if (!input_profile_exists(_profile_name, _player_index)) __input_error("Profile name \"", _profile_name, "\" doesn't exist");

#macro __INPUT_VERIFY_SOURCE  if (_global.__use_is_instanceof)\
                              {\
                                  if (!is_instanceof(_source, __input_class_source))\
                                  {\
                                      __input_error("Invalid source provided (", _source, ")");\
                                  }\
                              }\
                              else\
                              {\
                                  if (instanceof(_source) != "__input_class_source")\
                                  {\
                                      __input_error("Invalid source provided (", _source, ")");\
                                  }\
                              }

#macro __INPUT_VERIFY_SOURCE_ASSIGNABLE  if (_source == INPUT_KEYBOARD)\
                                         {\
                                             if (INPUT_ASSIGN_KEYBOARD_AND_MOUSE_TOGETHER)\
                                             {\
                                                 if (!_global.__any_keyboard_binding_defined && !_global.__any_mouse_binding_defined)\
                                                 {\
                                                    __input_error("Cannot claim ", _source, ", no keyboard or mouse bindings have been created in a default profile (see __input_config_verbs_and_bindings())");\
                                                 }\
                                             }\
                                             else\
                                             {\
                                                 if (!_global.__any_keyboard_binding_defined)\
                                                 {\
                                                     __input_error("Cannot claim ", _source, ", no keyboard bindings have been created in a default profile (see __input_config_verbs_and_bindings())");\
                                                 }\
                                             }\
                                         }\
                                         else if (_source == INPUT_MOUSE)\
                                         {\
                                             if (!_global.__any_mouse_binding_defined)\
                                             {\
                                                 __input_error("Cannot claim ", _source, ", no mouse bindings have been created in a default profile (see __input_config_verbs_and_bindings())");\
                                             }\
                                         }\
                                         else if (_source == INPUT_TOUCH)\
                                         {\
                                             if (!_global.__any_touch_binding_defined)\
                                             {\
                                                 __input_error("Cannot claim ", _source, ", no virtual button bindings have been created in a default profile (see __input_config_verbs_and_bindings())");\
                                             }\
                                         }\
                                         else if (_source.__source == __INPUT_SOURCE.GAMEPAD)\
                                         {\
                                             if (!_global.__any_gamepad_binding_defined)\
                                             {\
                                                 __input_error("Cannot claim ", _source, ", no gamepad bindings have been created in a default profile (see __input_config_verbs_and_bindings())");\
                                             }\
                                         }