function __input_binding_export(_binding)
{
    return _binding.__export();
}

function __input_binding_import(_binding_shell)
{
    return (new __input_class_binding()).__import(_binding_shell);
}

function __input_class_binding() constructor
{
    type          = undefined;
    value         = undefined;
    axis_negative = undefined;
    label         = undefined;
    
    __gamepad_index       = undefined;
    __gamepad_description = undefined;
    
    //We have an additional field on Android
    //This is used to check for uppercase *and* lowercase letters as Android checks for both individually
    android_lowercase = undefined;
    
    static __export = function()
    {
        var _binding_shell = {};
        
        if (type                  != undefined) _binding_shell.type                  = type;
        if (value                 != undefined) _binding_shell.value                 = value;
        if (axis_negative         != undefined) _binding_shell.axis_negative         = axis_negative;
        if (__gamepad_index       != undefined) _binding_shell.__gamepad_index       = __gamepad_index;
        if (__gamepad_description != undefined) _binding_shell.__gamepad_description = __gamepad_description;
        if (android_lowercase     != undefined) _binding_shell.android_lowercase     = android_lowercase;
        
        return _binding_shell;
    }
    
    static __import = function(_binding_shell)
    {
        if (_binding_shell.type                  != undefined) type                  = _binding_shell.type;
        if (_binding_shell.value                 != undefined) value                 = _binding_shell.value;
        if (_binding_shell.axis_negative         != undefined) axis_negative         = _binding_shell.axis_negative;
        if (_binding_shell.__gamepad_index       != undefined) __gamepad_index       = _binding_shell.__gamepad_index;
        if (_binding_shell.__gamepad_description != undefined) __gamepad_description = _binding_shell.__gamepad_description;
        if (_binding_shell.android_lowercase     != undefined) android_lowercase     = _binding_shell.android_lowercase;
        
        __set_label();
    }
    
    static __duplicate = function()
    {
        with(new __input_class_binding())
        {
            type                  = other.type;
            value                 = other.value;
            axis_negative         = other.axis_negative;
            label                 = other.label;
            __gamepad_index       = other.__gamepad_index;
            __gamepad_description = other.__gamepad_description;
            android_lowercase     = other.android_lowercase;
            return self;
        }
    }
    
    static __set_key = function(_key, _player_set)
    {
        //Fix uses of straight strings instead of ord("A")
        if (is_string(_key)) _key = ord(string_upper(_key));
        
        //Fix UTF-8 where used
        if (!__INPUT_KEYBOARD_NORMATIVE && !_player_set)
        {
            if      (_key == vk_comma    )  { _key = 44; }
            else if (_key == vk_hyphen   )  { _key = 45; }
            else if (_key == vk_period   )  { _key = 46; }
            else if (_key == vk_fslash   )  { _key = 47; }
            else if (_key == vk_semicolon)  { _key = 59; }
            else if (_key == vk_equals   )  { _key = 61; }
            else if (_key == vk_lbracket )  { _key = 91; }
            else if (_key == vk_bslash   )  { _key = 92; }
            else if (_key == vk_rbracket )  { _key = 93; }
            else if (_key == vk_backtick )  { _key = 96; }
        }
                
        if (os_type == os_android)
        {
            //Force binding to uppercase
            _key = ord(string_upper(chr(_key)));

            //Grab the keyboard character for this key and force it into lowercase
            //If the lowercase and uppercase keys are different then we'll want to check the lowercase key as well
            var _android_lowercase = ord(string_lower(chr(_key)));
            if (_android_lowercase != _key) android_lowercase = _android_lowercase;
            
            //Some Android devices and soft keyboards use carriage return for Enter, some use newline
            if ((_key == 10) || (_key == 13))
            {
                _key = 10;
                android_lowercase = 13;
            }
        }
        
        type  = __INPUT_BINDING_KEY;
        value = _key;
        
        __set_label();
        
        return self;
    }
    
    static __set_gamepad_axis = function(_axis, _negative)
    {
        type          = __INPUT_BINDING_GAMEPAD_AXIS;
        value         = _axis;
        axis_negative = _negative;
        
        __set_label();
        
        return self;
    }
    
    static __set_gamepad_button = function(_button)
    {
        type   = __INPUT_BINDING_GAMEPAD_BUTTON;
        value  = _button;
        
        __set_label();
        
        return self;
    }
    
    static __set_mouse_button = function(_button)
    {
        type  = __INPUT_BINDING_MOUSE_BUTTON;
        value = _button;
        
        __set_label();
        
        return self;
    }
    
    static __set_mouse_wheel_down = function()
    {
        type = __INPUT_BINDING_MOUSE_WHEEL_DOWN;
        
        __set_label();
        
        return self;
    }
    
    static __set_mouse_wheel_up = function()
    {
        type = __INPUT_BINDING_MOUSE_WHEEL_UP;
        
        __set_label();
        
        return self;
    }
    
    static __set_label = function(_label)
    {
        if (_label == undefined)
        {
            label = __input_binding_get_label(type, value, axis_negative)
        }
        else
        {
            label = _label;
        }
        
        return self;
    }
    
    static __set_gamepad = function(_gamepad)
    {
        if (input_gamepad_is_connected(_gamepad))
        {
            __gamepad_index = _gamepad;
            __gamepad_description = gamepad_get_description(_gamepad);
        }
        
        return self;
    }
    
    static __get_source_type = function()
    {
        switch(type)
        {
            case __INPUT_BINDING_KEY:              return __INPUT_SOURCE.KEYBOARD; break;
            case __INPUT_BINDING_MOUSE_BUTTON:     return __INPUT_SOURCE.MOUSE;    break;
            case __INPUT_BINDING_MOUSE_WHEEL_UP:   return __INPUT_SOURCE.MOUSE;    break;
            case __INPUT_BINDING_MOUSE_WHEEL_DOWN: return __INPUT_SOURCE.MOUSE;    break;
            case __INPUT_BINDING_GAMEPAD_BUTTON:   return __INPUT_SOURCE.GAMEPAD;  break;
            case __INPUT_BINDING_GAMEPAD_AXIS:     return __INPUT_SOURCE.GAMEPAD;  break;
            case undefined:                        return undefined;               break;
        }
        
        __input_error("Binding type \"", type, "\" not recognised");
    }
}
