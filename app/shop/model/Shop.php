<?php

namespace app\shop\model;

use think\Model;

/**
 * Shop
 */
class Shop extends Model
{
    // 表名
    protected $name = 'shop';

    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 追加属性
    protected $append = [
        // 'city_text',
    ];

    protected static function onAfterInsert($model)
    {
        if ($model->sort == 0) {
            $pk = $model->getPk();
            $model->where($pk, $model[$pk])->update(['sort' => $model[$pk]]);
        }
    }

    public function getCommissionRatioAttr($value): float
    {
        return (float)$value;
    }

    /*public function getCityAttr($value): array
    {
        if ($value === '' || $value === null) return [];
        if (!is_array($value)) {
            return explode(',', $value);
        }
        return $value;
    }

    public function setCityAttr($value): string
    {
        return is_array($value) ? implode(',', $value) : $value;
    }

    public function getCityTextAttr($value, $row): string
    {
        if ($row['city'] === '' || $row['city'] === null) return '';
        $cityNames = \think\facade\Db::name('area')->whereIn('id', $row['city'])->column('name');
        return $cityNames ? implode(',', $cityNames) : '';
    }*/

    public function user()
    {
        return $this->belongsTo(\app\admin\model\user\User::class, 'user_id', 'id');
    }
}