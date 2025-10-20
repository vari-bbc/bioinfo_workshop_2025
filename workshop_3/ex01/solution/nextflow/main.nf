nextflow.preview.output = true

// Count letters for each word
process count_letters {
  input:
    val word

  output:
    path "${word}.txt"

  script:
    """
    printf "${word}" | wc -c > ${word}.txt
    """
}

// Sum all counts into one file
process sum_letter_counts {
  input:
    path(count_files)

  output:
    path "summed.txt"

  script:
    """
    cat ${count_files} | awk '{sum += \$1} END {print "Total:", sum}' > summed.txt
    """
}

workflow {
    main:
    words_ch = Channel
              .fromPath('words.csv')
              .splitCsv(header: true)
              .map { item -> item['word'] }

    count_ch = count_letters(words_ch)
    sum_ch = sum_letter_counts(count_letters.out.collect())

    publish:
    count_out = count_ch
    sum_out = sum_ch
}

output {
    count_out {
        path 'step1'
    }
    sum_out {
        path 'step2'
    }
}


