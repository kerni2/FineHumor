import TomSelect from 'tom-select/dist/js/tom-select.popular'

document.addEventListener("turbolinks:load", function() {

  document.querySelectorAll('.js-multiple-select').forEach((element) => {
    let opts = {
      plugins: {
        'remove_button': {
          title: 'remove_button'
        },
        'no_backspace_delete': {},
        'restore_on_backspace': {}
      },
      valueField: 'id',
      labelField: 'title',
      searchField: 'title',
      create: false,
      load: function(query, callback) {
        const url = element.dataset.ajaxUrl + '.json?term=' + encodeURIComponent(query)

        fetch(url)
          .then(response => response.json())
          .then (json => {
            callback(json)
          }).catch(() => {
            callback()
          })
      },
      render: {
        no_results: function(_data, _escape){
          return '<div class="no-results">' + 'no_results' + '</div>';
        }
      }
    }

    new TomSelect(element, opts)
  })
})
