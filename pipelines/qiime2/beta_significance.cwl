#!/usr/bin/env cwl-runner
cwlVersion: v1.0
label: QIIME2 - Perform beta group significance analysis
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

hints:
  - class: DockerRequirement
    dockerPull: umigs/chiron-qiime2

inputs:
  input_dir:
    type: Directory
  matrix_file_base:
    type: string
  metadata_file:
    inputBinding:
      prefix: --m-metadata-file
    type: File
  metadata_category:
    inputBinding:
      prefix: --m-metadata-category
    type: string
  out_visualization:
    inputBinding:
      prefix: --o-visualization
    type: string
outputs:
  out_visual:
    type: File
    outputBinding:
      glob: $(inputs.out_visualization)

arguments:
  - valueFrom: $(inputs.input_dir.path + '/' + inputs.matrix_file_base)
    prefix: --i-distance-matrix
  - prefix: --p-pairwise"
baseCommand: ["qiime", "diversity", "beta-group-significance"]
