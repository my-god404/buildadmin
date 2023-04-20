<?php

namespace app\shop\controller;

use app\common\controller\Merchant;

class Dashboard extends Merchant
{
    public function dashboard()
    {
        $this->success('', [
            'remark' => get_route_remark()
        ]);
    }
}