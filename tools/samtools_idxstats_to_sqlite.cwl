#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - class: DockerRequirement
    dockerPull: quay.io/ncigdc/samtools_metrics_sqlite:294fa5fde699d338865096b815c6c5f4a8f2dfaeb4d22a52fcc93239f2d0066f
  - class: InlineJavascriptRequirement

class: CommandLineTool

inputs:
  - id: bam
    type: string
    inputBinding:
      prefix: --bam

  - id: input_state
    type: string
    inputBinding:
      prefix: --input_state

  - id: metric_path
    type: File
    inputBinding:
      prefix: --metric_path

  - id: uuid
    type: string
    inputBinding:
      prefix: --uuid

outputs:
  - id: log
    type: File
    outputBinding:
      glob: $(inputs.uuid+"_samtools_idxstats.log")

  - id: sqlite
    type: File
    outputBinding:
      glob: $(inputs.uuid + ".db")

baseCommand: [/usr/local/bin/samtools_metrics_sqlite, --metric_name, idxstats]
