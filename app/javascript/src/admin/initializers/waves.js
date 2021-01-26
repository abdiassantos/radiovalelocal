import Waves from 'node-waves'
import { domReady } from '../../utils'


const initWaves = () => {
  // Waves.attach('.btn, button, .waves-button', ['waves-button', 'waves-float'])
  Waves.attach('button')
  Waves.init()
}

export default domReady(initWaves)
