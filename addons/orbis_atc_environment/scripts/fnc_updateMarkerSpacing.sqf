private _array = param [0, []];

private _scaleStd = 0.0015;
private _fontMax = 0.05;
private _fontMin = 0.1;
private _scaleNow = ctrlMapScale ((findDisplay 12) displayCtrl 51);
private _fontScale = _fontMax max _scaleNow min _fontMin;

{
    _x params ["_marker1", "_marker2", "_marker3", "_pos"];

    private _size = getMarkerSize _marker1;
    private _xSpace = (_size select 0) * (_scaleNow / _scaleStd);
    private _ySpace = ((_size select 1) + 0.8 * (_fontMax / _fontScale)) * (_scaleNow / _scaleStd);

    _marker2 setMarkerPosLocal (_pos vectorAdd [_xSpace, -_ySpace, 0]);
    _marker3 setMarkerPosLocal (_pos vectorAdd [_xSpace, -_ySpace * 2, 0]);
} forEach _array;
