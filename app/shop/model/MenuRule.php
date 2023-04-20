<?php

namespace app\shop\model;

use think\Model;

/**
 * MenuRule 模型
 * @controllerUrl 'authMenu'
 */
class MenuRule extends Model
{
    protected $autoWriteTimestamp = 'int';
    protected $name = 'shop_menu_rule';
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

}