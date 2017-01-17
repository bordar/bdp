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
	public dynamic class BorhanPermission extends BaseFlexVo
	{
		/**
		**/
		public var id : int = int.MIN_VALUE;

		/**
		* @see com.borhan.types.BorhanPermissionType
		**/
		public var type : int = int.MIN_VALUE;

		/**
		**/
		public var name : String = null;

		/**
		**/
		public var friendlyName : String = null;

		/**
		**/
		public var description : String = null;

		/**
		* @see com.borhan.types.BorhanPermissionStatus
		**/
		public var status : int = int.MIN_VALUE;

		/**
		**/
		public var partnerId : int = int.MIN_VALUE;

		/**
		**/
		public var dependsOnPermissionNames : String = null;

		/**
		**/
		public var tags : String = null;

		/**
		**/
		public var permissionItemsIds : String = null;

		/**
		**/
		public var createdAt : int = int.MIN_VALUE;

		/**
		**/
		public var updatedAt : int = int.MIN_VALUE;

		/**
		**/
		public var partnerGroup : String = null;

		/** 
		* a list of attributes which may be updated on this object 
		**/ 
		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('name');
			arr.push('friendlyName');
			arr.push('description');
			arr.push('status');
			arr.push('dependsOnPermissionNames');
			arr.push('tags');
			arr.push('permissionItemsIds');
			arr.push('partnerGroup');
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
			}
			return result;
		}
	}
}
