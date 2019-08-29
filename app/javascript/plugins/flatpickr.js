import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

const init_flatpickr = () => {
  const picker = document.querySelector('.datepicker');

  if (picker) {
    const disabledDates = picker.form.dataset.disabledDates

    flatpickr(".datepicker.datepicker-search", {
      minDate: "today",
    });

    flatpickr(".datepicker.datepicker-booking", {
      minDate: "today",
      disable: JSON.parse(disabledDates),
    });
  }
};

init_flatpickr();
