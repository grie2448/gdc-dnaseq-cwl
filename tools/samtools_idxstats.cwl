#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: DockerRequirement
    dockerPull: quay.io/ncigdc/samtools:6161be62579a6f4fa21e1c200a6bf42585ac602829999d582ecd35825ca3695a
  - class: InlineJavascriptRequirement

class: CommandLineTool

inputs:
  - id: INPUT
    type: File
    format: "edam:format_2572"
    inputBinding:
      position: 0
    secondaryFiles:
      - ^.bai

outputs:
  - id: OUTPUT
    type: File
    outputBinding:
      glob: $(inputs.INPUT.nameroot + ".idxstats")

stdout: $(inputs.INPUT.nameroot + ".idxstats")

baseCommand: [/usr/local/bin/samtools, idxstats]
