<?php

namespace app\common\model;

use think\Model;
use think\model\concern\SoftDelete;

class Comment extends Model
{
    //软删除
    use SoftDelete;

    //添加评论
    public function add($data)
    {
        $validate = new \app\common\validate\Comment();
        if (!$validate->scene('add')->check($data)) {
            return $validate->getError();
        } else {
            $result = $this->allowField(true)->save($data);
            if ($result) {
                return 1;
            } else {
                return '添加失败';
            }
        }
    }

    //关联会员
    public function member()
    {
        return $this->belongsTo('Member', 'member_id', 'id');
    }

    //关联文章
    public function article()
    {
        return $this->belongsTo('Article', 'article_id', 'id');
    }

    //编辑评论
    public function edit($data){
        $validate= new \app\common\validate\Article();
        if (!$validate->scene('edit')->check($data)){
            return $this->getError();
        }else{
            $articleInfo= $this->find($data['id']);
            if ($articleInfo){
                $articleInfo->tags= $data['title'];
                $articleInfo->is_top= $data['is_top'];
                $articleInfo->cate_id= $data['cate_id'];
                $result= $articleInfo->save();
                if ($result){
                    return 1;
                }else{
                    return '修改文章失败';
                }
            }
        }
    }


    //前台添加评论
    public function comment($data)
    {
        $validate = new \app\common\validate\Comment();
        if (!$validate->scene('comment')->check($data)) {
            return $validate->getError();
        } else {
            $result = $this->allowField(true)->save($data);
            if ($result) {
                return 1;
            } else {
                return '评论失败';
            }
        }
    }
}
