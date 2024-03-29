cwlVersion: v1.0
class: CommandLineTool
id: fastqc_db
requirements:
  - class: DockerRequirement
    dockerPull: "{{ docker_repo }}/fastqc_db:{{ fastqc_db }}"
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 1
    coresMax: 1
    ramMin: 1000
    ramMax: 1000
    tmpdirMin: 100
    tmpdirMax: 100
    outdirMin: 10
    outdirMax: 10

inputs:
  INPUT:
    type: File
    inputBinding:
      prefix: --INPUT

  job_uuid:
    type: string
    inputBinding:
      prefix: --job_uuid

outputs:
  LOG:
    type: File
    outputBinding:
      glob: $(inputs.job_uuid + ".log")

  OUTPUT:
    type: File
    outputBinding:
      glob: $(inputs.INPUT.nameroot + ".db")

baseCommand: [/usr/local/bin/fastqc_db]
