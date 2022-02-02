import * as moment from 'moment'

export class Auxiliary {
    static getFormattedDate(createdOn: string): string {
        return moment(new Date(createdOn)).format("hh:mm, DD MMM YYYY")
    }
}
