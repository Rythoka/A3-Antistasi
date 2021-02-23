params ["_vehicles", "_lockUID"];
#include "defines.inc"

{
    private _cat = [_x] call HR_GRG_fnc_getCatIndex;
    private _vehUID = [] call HR_GRG_fnc_genVehUID;
    (HR_GRG_Vehicles#_cat) pushBack [cfgDispName(_x), _x, _lockUID, "", _vehUID, [[1,-1,nil],[0,[[],[]],-1],[]]];
} forEach _vehicles;
