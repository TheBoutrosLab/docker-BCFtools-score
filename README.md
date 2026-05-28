# docker-BCFtools-score
Boutros Lab Docker image for `bcftools` with the Broad Institute `score` plugin preinstalled.

The image is built with a Miniforge-based builder stage and ships a runtime environment configured for `bcftools` plugins through the `BCFTOOLS_PLUGINS` environment variable.

---

# Version
| Tool | Version |
|------|---------|
| bcftools | 1.22 |
| score | 1.22-20250819 |

---

## Discussions

- [Issue tracker](https://github.com/TheBoutrosLab/docker-BCFtools-score/issues) to report errors and enhancement ideas.
- Discussions can take place in [docker-BCFtools-score Discussions](https://github.com/TheBoutrosLab/docker-BCFtools-score/discussions).
- [docker-BCFtools-score pull requests](https://github.com/TheBoutrosLab/docker-BCFtools-score/pulls) are also open for discussion.

---

## Contributors

Please see the list of [Contributors](https://github.com/TheBoutrosLab/docker-BCFtools-score/graphs/contributors) at GitHub.

---

## References

1. [bcftools documentation](https://samtools.github.io/bcftools/bcftools.html)
2. [bcftools GitHub repository](https://github.com/samtools/bcftools)
3. [Broad Institute score plugin download page](https://software.broadinstitute.org/software/score/)
4. [Bioconda package recipe for bcftools](https://bioconda.github.io/recipes/bcftools/README.html)
5. Petr Danecek, James K Bonfield, Jie Song, Vincent Accarpi, Rudolf Albers, Alistair Amstislavskiy, Tim JK Chan, Martin DePristo, Robert L Handsaker, Gerton Lunter, Gabor T Marth, Shane T McCarthy, Mark A Rodelsperger, Kai Ye, Gilean A McVean, Richard Durbin. Twelve years of SAMtools and BCFtools. Gigascience. 2021 Feb 16;10(2):giab008. https://doi.org/10.1093/gigascience/giab008

---

## License

Author: Yash Patel

`docker-BCFtools-score` is licensed under the GNU General Public License version 2. See the file LICENSE for the terms of the GNU GPL license.

`docker-BCFtools-score` provides a Docker image for `bcftools` with the Broad Institute `score` plugin.

Copyright (C) 2026 Sanford Burnham Prebys Medical Discovery Institute ("Boutros Lab") All rights reserved.

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
