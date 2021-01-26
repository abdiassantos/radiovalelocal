import PerfectScrollbar from 'perfect-scrollbar'
import { domReady } from '../../utils'

const initPerfectScrollbar = () => {
  const container = document.querySelector('.container-scroller')
  if (container) {
    new PerfectScrollbar(container)
  }
}

export default domReady(initPerfectScrollbar)