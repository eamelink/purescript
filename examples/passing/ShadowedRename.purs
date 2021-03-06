module Main where

import Control.Monad.Eff
import Debug.Trace

foreign import f
  """
  function f(x) {
    return function() {
      if (x !== 2.0) throw new Error('x is not 2.0');
    };
  }
  """ :: forall e. Number -> Eff e Number

foo foo = let foo_1 = \_ -> foo
              foo_2 = foo_1 unit + 1.0
          in foo_2

main = do
  f (foo 1.0)
  trace "Done"
