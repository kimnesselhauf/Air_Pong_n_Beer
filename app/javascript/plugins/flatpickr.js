import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"

const picker = document.querySelector('.datepicker');
const disabledDates = picker.form.dataset.disabledDates;

flatpickr(".datepicker", {
  minDate: "today",
  disable: JSON.parse(disabledDates),

});
