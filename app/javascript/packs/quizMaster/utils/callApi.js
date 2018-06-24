import request from 'superagent'
import noCache from 'superagent-no-cache'

const domain = process.env.NODE_ENV === 'production' ||
  process.env.NODE_ENV === 'staging' ||
  process.env.NODE_ENV === 'development' ? '/api/v1' : 'http://localhost:3000/api/v1';

export const METHOD_TYPE = {
  GET: 'GET',
  POST: 'POST',
  PUT: 'PUT',
  DELETE: 'DELETE'
}

/**
 * XHRを実行
 * @param {string} apiPath APIのパス
 * @param {string} method Methodのタイプ
 * @param {object} params リクエストパラメータ
 * @return {Promise} リクエスト処理のPromise
 */
export default function callApi (apiPath, method, params = {}) {
  // URLを生成
  const endpoint = `${domain}${apiPath}`
  const timeout = 60000
  return new Promise((resolve, reject) => {
    const req = request(method, endpoint).timeout(timeout).use(noCache).withCredentials()

    // GETの場合はqueryを
    if (method === METHOD_TYPE.GET) {
      req.query(params)
    }

    // POSTの場合はbodyを
    if (method === METHOD_TYPE.POST || method === METHOD_TYPE.PUT) {
      req.send(params)
    }

    req.then((res) => {
      if (res.ok) {
        resolve(res)
      } else {
        // ajaxが失敗した
        reject(res)
      }
    }).catch((e) => {
      // ajaxが失敗した
      /* eslint-disable */
      reject({
        message: e.message,
        status: e.status,
        response: e.response
      })
    })
  })
}
