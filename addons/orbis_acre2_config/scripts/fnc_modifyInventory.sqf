params ["_unit", "_container", "_mode", "_item"];

switch (_container) do {
	case 0: {
		switch (_mode) do {
			case "add": {_unit addItemToUniform _item};
			case "remove": {_unit removeItemFromUniform _item};
		};
	};
	case 1: {
		switch (_mode) do {
			case "add": {_unit addItemToVest _item};
			case "remove": {_unit removeItemFromVest _item};
		};
	};
	case 2: {
		switch (_mode) do {
			case "add": {_unit addItemToBackpack _item};
			case "remove": {_unit removeItemFromBackpack _item};
		};
	};
};
