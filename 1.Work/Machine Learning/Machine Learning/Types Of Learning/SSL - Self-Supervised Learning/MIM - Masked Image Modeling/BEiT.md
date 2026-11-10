However, reconstructing images introduces a computational challenge.

Consider an image divided into 196 patches. If we mask 75% of them, only 49 patches remain visible.

A straightforward approach would still feed all 196 patches into the encoder, including mask tokens.