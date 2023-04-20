<?php
return [
    \app\common\middleware\AllowCrossDomain::class,
    \app\shop\middleware\AdminLog::class,
    \think\middleware\LoadLangPack::class,
];
