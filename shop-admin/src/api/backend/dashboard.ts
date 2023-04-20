import createAxios from '/@/utils/axios'

export function dashboard() {
    return createAxios({
        url: '/shop/Dashboard/dashboard',
        method: 'get',
    })
}
