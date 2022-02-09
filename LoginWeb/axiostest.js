
import axios from 'axios';
 
//创建一个axios
export let axios = axios.create({
//设置baseURL是为了之后做代理
  baseURL: '/api',
  timeout: 5000
});
 