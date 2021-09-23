//
//  ListFilterWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias ListFilterresponseHandler = (_ response:ListFilterModel.Fetch.Response) ->()

class ListFilterWorker{
    
   var respData = [ListFilterModels]()
    func fetch(user_id:String,cat_id:String,sub_cat_id:String, onSuccess successCallback:(ListFilterresponseHandler)?,onFailure failureCallback: @escaping(ListFilterresponseHandler)) {
       let manager = APIManager()
       manager.callAPIListFilter(
        user_id:user_id,cat_id:cat_id,sub_cat_id:sub_cat_id, onSuccess: { (resp)  in
               successCallback?(ListFilterModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ListFilterModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
