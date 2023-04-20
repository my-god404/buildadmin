<?php

namespace app\shop\model;

use think\Model;

/**
 * AdminGroup模型
 * @controllerUrl 'authGroup'
 */
class AdminGroup extends Model
{
    protected $autoWriteTimestamp = 'int';
    protected $name = 'shop_admin_group';
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
}