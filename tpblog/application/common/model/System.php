<?php

namespace app\common\model;

use think\Model;

class System extends Model
{
    //编辑web信息
    public function edit($data){
        $validate= new \app\common\validate\System();
        if (!$validate->scene('edit')->check($data)){
            return $validate->getError();
        }else{
            //修改数据库
            //先查询后修改
            $webInfo= $this->find($data['id']);
            $webInfo->webname= $data['webname'];
            $webInfo->copyright= $data['copyright'];
            $result= $webInfo->save();

            if ($result){
                return 1;
            }else{
                return "修改网站信息失败";
            }


        }
    }
}
