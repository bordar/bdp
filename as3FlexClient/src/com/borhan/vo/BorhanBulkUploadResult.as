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
	import com.borhan.vo.BaseFlexVo;

	[Bindable]
	public dynamic class BorhanBulkUploadResult extends BaseFlexVo
	{
		/**
		* The id of the result
		* 
		**/
		public var id : int = int.MIN_VALUE;

		/**
		* The id of the parent job
		* 
		**/
		public var bulkUploadJobId : Number = Number.NEGATIVE_INFINITY;

		/**
		* The index of the line in the CSV
		* 
		**/
		public var lineIndex : int = int.MIN_VALUE;

		/**
		**/
		public var partnerId : int = int.MIN_VALUE;

		/**
		* @see com.borhan.types.BorhanBulkUploadResultStatus
		**/
		public var status : String = null;

		/**
		* @see com.borhan.types.BorhanBulkUploadAction
		**/
		public var action : String = null;

		/**
		**/
		public var objectId : String = null;

		/**
		**/
		public var objectStatus : int = int.MIN_VALUE;

		/**
		* @see com.borhan.types.BorhanBulkUploadResultObjectType
		**/
		public var bulkUploadResultObjectType : String = null;

		/**
		* The data as recieved in the csv
		* 
		**/
		public var rowData : String = null;

		/**
		**/
		public var partnerData : String = null;

		/**
		**/
		public var objectErrorDescription : String = null;

		/**
		**/
		public var pluginsData : Array = null;

		/**
		**/
		public var errorDescription : String = null;

		/**
		**/
		public var errorCode : String = null;

		/**
		**/
		public var errorType : int = int.MIN_VALUE;

		/** 
		* a list of attributes which may be updated on this object 
		**/ 
		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('bulkUploadJobId');
			arr.push('lineIndex');
			arr.push('partnerId');
			arr.push('status');
			arr.push('action');
			arr.push('objectId');
			arr.push('objectStatus');
			arr.push('bulkUploadResultObjectType');
			arr.push('rowData');
			arr.push('partnerData');
			arr.push('objectErrorDescription');
			arr.push('pluginsData');
			arr.push('errorDescription');
			arr.push('errorCode');
			arr.push('errorType');
			return arr;
		}

		/** 
		* a list of attributes which may only be inserted when initializing this object 
		**/ 
		public function getInsertableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			return arr;
		}

		/** 
		* get the expected type of array elements 
		* @param arrayName 	 name of an attribute of type array of the current object 
		* @return 	 un-qualified class name 
		**/ 
		public function getElementType(arrayName:String):String
		{
			var result:String = '';
			switch (arrayName) {
				case 'pluginsData':
					result = 'BorhanBulkUploadPluginData';
					break;
			}
			return result;
		}
	}
}
