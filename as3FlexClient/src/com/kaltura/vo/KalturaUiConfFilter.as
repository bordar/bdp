package com.kaltura.vo
{
	import com.kaltura.vo.KalturaUiConfBaseFilter;

	[Bindable]
	public dynamic class KalturaUiConfFilter extends KalturaUiConfBaseFilter
	{
		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

		override public function getInsertableParamKeys():Array
		{
			var arr : Array;
			arr = super.getInsertableParamKeys();
			return arr;
		}

	}
}
