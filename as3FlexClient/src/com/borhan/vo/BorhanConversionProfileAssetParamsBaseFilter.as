// ===================================================================================================
//                           _  __     _ _
//                          | |/ /__ _| | |_ _  _ _ _ __ _
//                          | ' </ _` | |  _| || | '_/ _` |
//                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
//
// This file is part of the Borhan Collaborative Media Suite which allows users
// to do with audio, video, and animation what Wiki platfroms allow them to do with
// text.
//
// Copyright (C) 2006-2011  Borhan Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// @ignore
// ===================================================================================================
package com.borhan.vo
{
	import com.borhan.vo.BorhanFilter;

	[Bindable]
	public dynamic class BorhanConversionProfileAssetParamsBaseFilter extends BorhanFilter
	{
		/**
		**/
		public var conversionProfileIdEqual : int = int.MIN_VALUE;

		/**
		**/
		public var conversionProfileIdIn : String = null;

		/**
		**/
		public var assetParamsIdEqual : int = int.MIN_VALUE;

		/**
		**/
		public var assetParamsIdIn : String = null;

		/**
		* @see com.borhan.types.BorhanFlavorReadyBehaviorType
		**/
		public var readyBehaviorEqual : int = int.MIN_VALUE;

		/**
		**/
		public var readyBehaviorIn : String = null;

		/**
		* @see com.borhan.types.BorhanAssetParamsOrigin
		**/
		public var originEqual : int = int.MIN_VALUE;

		/**
		**/
		public var originIn : String = null;

		/**
		**/
		public var systemNameEqual : String = null;

		/**
		**/
		public var systemNameIn : String = null;

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('conversionProfileIdEqual');
			arr.push('conversionProfileIdIn');
			arr.push('assetParamsIdEqual');
			arr.push('assetParamsIdIn');
			arr.push('readyBehaviorEqual');
			arr.push('readyBehaviorIn');
			arr.push('originEqual');
			arr.push('originIn');
			arr.push('systemNameEqual');
			arr.push('systemNameIn');
			return arr;
		}

		override public function getInsertableParamKeys():Array
		{
			var arr : Array;
			arr = super.getInsertableParamKeys();
			return arr;
		}

		override public function getElementType(arrayName:String):String
		{
			var result:String = '';
			switch (arrayName) {
				default:
					result = super.getElementType(arrayName);
					break;
			}
			return result;
		}
	}
}
