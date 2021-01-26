import dayjs from 'dayjs'

export const domReady = fn =>
  document.readyState === 'interactive' || document.readyState === 'complete'
    ? fn()
    : document.addEventListener('DOMContentLoaded', fn)
