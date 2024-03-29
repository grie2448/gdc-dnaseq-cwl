cwlVersion: v1.0
class: CommandLineTool
id: fastqc
requirements:
  - class: DockerRequirement
    dockerPull: "{{ docker_repo }}/fastqc:{{ fastqc }}"
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: $(inputs.threads)
    coresMax: $(inputs.threads)
    ramMin: 5000
    ramMax: 5000
    tmpdirMin: 50
    tmpdirMax: 50
    outdirMin: 5
    outdirMax: 5

inputs:
  adapters:
    type: ["null", File]
    inputBinding:
      prefix: --adapters

  casava:
    type: boolean
    default: false
    inputBinding:
      prefix: --casava

  contaminants:
    type: ["null", File]
    inputBinding:
      prefix: --contaminants

  dir:
    type: string
    default: .
    inputBinding:
      prefix: --dir

  extract:
    type: boolean
    default: false
    inputBinding:
      prefix: --extract

  format:
    type: string
    default: fastq
    inputBinding:
      prefix: --format

  INPUT:
    type: File
    inputBinding:
      position: 99

  kmers:
    type: long
    default: 7
    inputBinding:
      prefix: --kmers

  limits:
    type: ["null", File]
    inputBinding:
      prefix: --limits

  nano:
    type: boolean
    default: false
    inputBinding:
      prefix: --nano

  noextract:
    type: boolean
    default: true
    inputBinding:
      prefix: --noextract

  nofilter:
    type: boolean
    default: false
    inputBinding:
      prefix: --nofilter

  nogroup:
    type: boolean
    default: false
    inputBinding:
      prefix: --nogroup

  outdir:
    type: string
    default: .
    inputBinding:
      prefix: --outdir

  quiet:
    type: boolean
    default: false
    inputBinding:
      prefix: --quiet

  threads:
    type: long
    default: 1
    inputBinding:
      prefix: --threads

outputs:
  OUTPUT:
    type: File
    outputBinding:
      glob: "*_fastqc.zip"

baseCommand: [/usr/local/FastQC/fastqc]
