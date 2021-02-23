/*
    Author: [Håkon]
    [Description]
        Switches the current selected vehicle category

    Arguments:
    0. <Control>    Category list control
    1. <Int>        Index of new active category

    Return Value:
    <>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: _this call HR_GRG_fnc_switchCategory;

    License: MIT License
*/
#include "defines.inc"
params ["_listCtrl", "_index"];
if (_index isEqualTo -1) exitWith {};
private _disp = findDisplay IDD_Garage;

//disables current category
for "_i" from 0 to (lbSize _listCtrl) - 1 do {
    private _ctrl = _disp displayCtrl (IDC_CatCar + _i);
    if (ctrlEnabled _ctrl) exitWith {
        _ctrl ctrlSetPosition ctrlDisabled;
        _ctrl ctrlEnable false;
        _ctrl ctrlCommit 0;
    };
};

//refresh new category
private _disp = findDisplay IDD_Garage;
_newCtrl = _disp displayCtrl (IDC_CatCar + _index);
[_newCtrl, _index] call HR_GRG_fnc_reloadCategory;

//activate new category
_newCtrl ctrlEnable true;
_newCtrl ctrlSetPosition CatEnabled;
_newCtrl ctrlCommit 0;

//update category text
_textCtrl = _disp displayCtrl IDC_CatText;
_textCtrl ctrlSetStructuredText text (_listCtrl lbData _index);
