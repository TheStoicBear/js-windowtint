['tint_meter'] = {
    label = 'Tint Meter',
    weight = 1000,  -- Adjust weight as needed
    stack = false,  -- Assuming one tint_meter cannot be stacked
    close = true,   -- Close inventory after use
    description = 'Laser Labs Enforcer II – TM1000',
    client = {
        export = 'js-windowtint.tintmeter:useItem'
    }
},
